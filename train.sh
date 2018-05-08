#NETWORK=sphere_network
NETWORK=resface
#NETWORK=inception_net
#NETWORK=resnet_v2

CROP=112
echo $NAME
#GPU=0
GPU=0,1,2,3
NUM_GPUS=4
ARGS="CUDA_VISIBLE_DEVICES=${GPU}"
WEIGHT_DECAY=1e-3
LOSS_TYPE=cosface
#LOSS_TYPE=softmax
SCALE=64.
#WEIGHT=3.
#SCALE=32.
WEIGHT=2.
#WEIGHT=2.5
ALPHA=0.15
#ALPHA=0.25
#ALPHA=0.2
#ALPHA=0.3
#LR_FILE=lr_coco.txt
LR_FILE=lr_scatter.txt
OPT=ADAM
#OPT=MOM
FC_BN='--fc_bn'
NAME=${NETWORK}_${LOSS_TYPE}_${CROP}_${GPU}_${SCALE}_${WEIGHT}_${ALPHA}_${OPT}_${FC_BN}
#CMD="python train_softmax_mult_gpu.py --logs_base_dir logs/${NAME}/ --models_base_dir models/$NAME/ --data_dir dataset/CASIA-maxpy-clean --image_size 160 --model_def models.inception_resnet_v1 --lfw_dir '' --optimizer MOM --learning_rate -1 --max_nrof_epochs 100 --random_flip --learning_rate_schedule_file learning_rate_schedule_classifier_resnet.txt  --num_gpus 1 --weight_decay ${WEIGHT_DECAY} --loss_type ${LOSS_TYPE} --scale ${SCALE} --weight ${WEIGHT} --alpha ${ALPHA}"
#CMD="python train/train_multi_gpu.py --logs_base_dir logs/${NAME}/ --models_base_dir models/$NAME/ --data_dir dataset/CASIA-maxpy-clean --image_size 160 --model_def models.inception_resnet_v1  --optimizer MOM --learning_rate -1 --max_nrof_epochs 100 --random_flip --learning_rate_schedule_file ${LR_FILE}  --num_gpus 1 --weight_decay ${WEIGHT_DECAY} --loss_type ${LOSS_TYPE} --scale ${SCALE} --weight ${WEIGHT} --alpha ${ALPHA} --network ${NETWORK}"
#CMD="python train/train_multi_gpu.py --logs_base_dir logs/${NAME}/ --models_base_dir models/$NAME/ --data_dir dataset/CASIA-WebFace-112X96 --model_def models.inception_resnet_v1  --optimizer MOM --learning_rate -1 --max_nrof_epochs 100 --random_flip --learning_rate_schedule_file ${LR_FILE}  --num_gpus 1 --weight_decay ${WEIGHT_DECAY} --loss_type ${LOSS_TYPE} --scale ${SCALE} --weight ${WEIGHT} --alpha ${ALPHA} --network ${NETWORK}"
CMD="python train/train_multi_gpu.py --logs_base_dir logs/${NAME}/ --models_base_dir models/$NAME/ --data_dir dataset/CASIA-WebFace-112X96 --model_def models.inception_resnet_v1  --optimizer ${OPT} --learning_rate -1 --max_nrof_epochs 100 --random_flip --learning_rate_schedule_file ${LR_FILE}  --num_gpus ${NUM_GPUS} --weight_decay ${WEIGHT_DECAY} --loss_type ${LOSS_TYPE} --scale ${SCALE} --weight ${WEIGHT} --alpha ${ALPHA} --network ${NETWORK} ${FC_BN}"
echo Run "$ARGS ${CMD}"
eval "$ARGS ${CMD}"
