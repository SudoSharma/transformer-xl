#!/bin/bash

echo 'Run training locally...'
python train.py \
	--seed 100 \
	--log-interval 20 \
	--eval-interval 500 \
	--max_tokens 1000000 \
	--batch_size 32 \
	--work_dir ./workdir \
	--dataset wt103 \
	--adaptive \
	--data ../data/wikitext-2 \
	--n_layer 8 \
	--d_model 410 \
	--n_head 10 \
	--d_head 41 \
	--d_inner 2100 \
	--dropout 0.1 \
	--dropatt 0.0 \
	--tgt_len 150 \
	--mem_len 150 \
	--eval_tgt_len 150 \
	--lr 0.001 \
	--skip-auto-shutdown \
	${@:2}
