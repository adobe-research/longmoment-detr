dset_name=youtube
ctx_mode=video_tef
v_feat_types=slowfast
t_feat_type=clip 
results_root=results_eval
exp_id=vit-b

######## data paths
train_path=ytc_data/train.jsonl
eval_path=ytc_data/test.jsonl
eval_split_name=test

######## setup video+text features
feat_root=features/

# video features
v_feat_dim=0
v_feat_dirs=()
if [[ ${v_feat_types} == *"slowfast"* ]]; then
  v_feat_dirs+=(${feat_root}/slowfast_features/)
  (( v_feat_dim += 2304 ))  # double brackets for arithmetic op, no need to use ${v_feat_dim}
fi

# text features
t_feat_dir=${feat_root}/gpt2_ytc/
t_feat_dim=1600

#### training
bsz=16
num_workers=8
n_epoch=15
max_es_cnt=300
exp_id=pt


PYTHONPATH=$PYTHONPATH:. python moment_detr/eval.py \
--eval_untrained \
--is_eval True \
--max_q_l 500 \
--dset_name ${dset_name} \
--ctx_mode ${ctx_mode} \
--train_path ${train_path} \
--eval_path ${eval_path} \
--eval_split_name ${eval_split_name} \
--v_feat_dirs ${v_feat_dirs[@]} \
--v_feat_dim ${v_feat_dim} \
--t_feat_dir ${t_feat_dir} \
--t_feat_dim ${t_feat_dim} \
--bsz ${bsz} \
--eval_bsz 32 \
--results_root ${results_root} \
--num_workers ${num_workers} \
--exp_id ${exp_id} \
--n_epoch ${n_epoch} \
--max_es_cnt ${max_es_cnt} \
--clip_length 8 \
--max_v_l 10000 \
${@:1}
