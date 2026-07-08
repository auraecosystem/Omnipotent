data = [types.Datum(
model_input=types.ModelInput.from_ints(tokenizer.encode("Hello")),
loss_fn_inputs={"target_tokens": types.ModelInput.from_ints(tokenizer.encode("world"))}
)]
future = training_client.forward(data, "cross_entropy")
result = await future
print(f"Loss: {result.loss}")
data = [types.Datum(
model_input=types.ModelInput.from_ints(tokenizer.encode("Hello")),
loss_fn_inputs={"target_tokens": types.ModelInput.from_ints(tokenizer.encode("world"))}
)]

# Compute gradients
fwdbwd_future = training_client.forward_backward(data, "cross_entropy")

# Update parameters
optim_future = training_client.optim_step(
types.AdamParams(learning_rate=1e-4)
)

fwdbwd_result = await fwdbwd_future
print(f"Loss: {fwdbwd_result.loss}")
def custom_loss(data, logprobs_list):
# Custom loss computation
loss = torch.mean(torch.stack([torch.mean(lp) for lp in logprobs_list]))
metrics = {"custom_metric": loss.item()}
return loss, metrics

future = training_client.forward_backward_custom(data, custom_loss)
result = future.result()
print(f"Custom loss: {result.loss}")
print(f"Metrics: {result.metrics}")
# First compute gradients
fwdbwd_future = training_client.forward_backward(data, "cross_entropy")

# Then update parameters
optim_future = training_client.optim_step(
types.AdamParams(
learning_rate=1e-4,
weight_decay=0.01
)
)

# Wait for both to complete
fwdbwd_result = await fwdbwd_future
optim_result = await optim_future

# Save weights for inference
save_future = training_client.save_weights_for_sampler("sampler-001")
result = await save_future
print(f"Sampler weights saved to: {result.path}")

# Use the path to create a sampling client
sampling_client = service_client.create_sampling_client(
model_path=result.path
)
# After training, create a sampling client directly
sampling_client = training_client.save_weights_and_get_sampling_client()

# Now use it for inference
prompt = types.ModelInput.from_ints(tokenizer.encode("Hello"))
params = types.SamplingParams(max_tokens=20)
result = sampling_client.sample(prompt, 1, params).result()
