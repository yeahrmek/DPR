python -m torch.distributed.launch --nproc_per_node=8 train_dense_encoder.py \
    encoder=[hf_roberta] \
    train_datasets=[lean_questions_train] \
    dev_datasets=[lean_questions_dev] \
    train=biencoder_lean_questions \
    output_dir=outputs