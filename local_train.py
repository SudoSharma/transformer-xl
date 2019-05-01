#!/bin/bash

echo 'Run training locally...'
python -m torch.distributed.launch train.py \
	--seed 1111 \
	--data ../data/wikitext-2 \
	--dataset wt2 \
	--adaptive \
	--log_interval 100 \
	--n_layer 16 \
	--d_model 512 \
	--n_head 8 \
	--d_head 48 \
	--d_inner 2048 \
	--dropout 0.1 \
	--dropatt 0.0 \
	--optim lamb \
	--lr 0.001 \
	--wd 0 \
	--max_tokens 100000 \
	--tgt_len 128 \
	--mem_len 128 \
	--eval_tgt_len 128 \
	--batch_size 32 \
	--eval_interval 4000 \
	--skip_auto_shutdown \
