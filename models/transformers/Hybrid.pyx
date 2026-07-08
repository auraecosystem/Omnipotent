from tinker_cookbook.hyperparam_utils import get_lora_param_count

model_name = "Qwen/Qwen3.5-9B"
print(get_lora_param_count(model_name, lora_rank=x))
