torchrun --nproc_per_node=8 --master_port=3000 train.py \
    --model_name_or_path "/media/Hera/haoc/xixu/llama/llama-2-7b-chat-hf" \
    --data_path ./alpaca_data.json \
    --fp16 \
    --output_dir ./output_dir \
    --num_train_epochs 3 \
    --per_device_train_batch_size 4 \
    --per_device_eval_batch_size 4 \
    --gradient_accumulation_steps 8 \
    --evaluation_strategy "no" \
    --save_strategy "steps" \
    --save_steps 2000 \
    --save_total_limit 1 \
    --learning_rate 2e-5 \
    --weight_decay 0. \
    --warmup_ratio 0.03 \
    --lr_scheduler_type "cosine" \
    --logging_steps 1 \
    --fsdp "full_shard auto_wrap" \
    --fsdp_transformer_layer_cls_to_wrap 'LlamaDecoderLayer'