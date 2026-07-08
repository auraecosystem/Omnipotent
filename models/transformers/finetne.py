from tinker_cookbook.hyperparam_utils import get_lora_lr_over_full_finetune_lr

model_name = "Qwen/Qwen3.5-9B"
print(get_lora_lr_over_full_finetune_lr(lmlm))
