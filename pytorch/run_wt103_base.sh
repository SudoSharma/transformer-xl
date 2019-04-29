#!/bin/bash

if [[ $1 == 'train' ]]; then
    echo 'Run training...'
    python train.py \
        --seed 1111 \
        --cuda \
        --data ../data/wikitext-103/ \
        --dataset wt103 \
        --adaptive \
        --log-interval 20 \
        --n_layer 16 \
        --d_model 410 \
        --n_head 10 \
        --d_head 41 \
        --d_inner 2100 \
        --dropout 0.1 \
        --dropatt 0.0 \
        --optim adam \
        --lr 0.00025 \
        --warmup_tokens 0 \
        --max_tokens $(expr 200000 \* 60 \* 150) \
        --tgt_len 150 \
        --mem_len 150 \
        --eval_tgt_len 150 \
        --batch_size 60 \
        --gpu0_bsz 4 \
        ${@:2}
elif [[ $1 == 'dgc' ]]; then
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
elif [[ $1 == 'eval' ]]; then
    echo 'Run evaluation...'
    python eval.py \
        --cuda \
        --data ../data/wikitext-103/ \
        --dataset wt103 \
        --tgt_len 64 \
        --mem_len 640 \
        --clamp_len 400 \
        --same_length \
        --split test \
        ${@:2}
else
    echo 'unknown argment 1'
fi
