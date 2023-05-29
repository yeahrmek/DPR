python generate_dense_embeddings.py \
	model_file=/home/jovyan/DPR/outputs/2023-05-03/21-49-01/outputs/roberta_biencoder.25 \
	ctx_src=lean_lemmas \
	shard_id=0 num_shards=1 \
	out_file=/home/jovyan/yura/DPR/outputs/embeddings/out	
    
python generate_dense_embeddings.py \
	model_file=/home/jovyan/DPR/outputs/2023-05-03/21-49-01/outputs/roberta_biencoder.25 \
	ctx_src=lean_lemmas_no_none \
	shard_id=0 num_shards=1 \
	out_file=/home/jovyan/yura/DPR/outputs/embeddings/out_no_none




python dense_retriever.py \
	model_file=/home/jovyan/DPR/outputs/2023-05-03/21-49-01/outputs/roberta_biencoder.25 \
	qa_dataset=lean_questions_dev \
	ctx_datatsets=[lean_lemmas_no_none] \
	encoded_ctx_files=[\"/home/jovyan/yura/DPR/outputs/embeddings/out_no_none_0\"] \
	out_file=/home/jovyan/yura/DPR/outputs/topk_results_no_none.json

python dense_retriever.py \
	model_file=/home/jovyan/DPR/outputs/2023-05-03/21-49-01/outputs/roberta_biencoder.25 \
	qa_dataset=lean_questions_dev \
	ctx_datatsets=[lean_lemmas] \
	encoded_ctx_files=[\"/home/jovyan/yura/DPR/outputs/embeddings/out_0\"] \
	out_file=/home/jovyan/yura/DPR/outputs/topk_results_with_none.json



#train:
python dense_retriever.py \
	model_file=/home/jovyan/DPR/outputs/2023-05-03/21-49-01/outputs/roberta_biencoder.25 \
	qa_dataset=lean_questions_train \
	ctx_datatsets=[lean_lemmas_no_none] \
	encoded_ctx_files=[\"/home/jovyan/yura/DPR/outputs/embeddings/out_no_none_0\"] \
	out_file=/home/jovyan/yura/DPR/outputs/topk_results_train_no_none.json


python dense_retriever.py \
	model_file=/home/jovyan/DPR/outputs/2023-05-03/21-49-01/outputs/roberta_biencoder.25 \
	qa_dataset=lean_questions_train \
	ctx_datatsets=[lean_lemmas] \
	encoded_ctx_files=[\"/home/jovyan/yura/DPR/outputs/embeddings/out_0\"] \
	out_file=/home/jovyan/yura/DPR/outputs/topk_results_train_with_none.json
