# Moment Detection in Long Tutorial Videos

This repository contains the code for `LongMoment-DETR`, a method designed for moment detection in long tutorial videos. Additionally, it houses two datasets: Behance Moment Detection (BMD) and YouTube Chapters (YTC), tailored for the same purpose. Our [ICCV 2023 paper](https://openaccess.thecvf.com/content/ICCV2023/papers/Croitoru_Moment_Detection_in_Long_Tutorial_Videos_ICCV_2023_paper.pdf) ([supplement](https://openaccess.thecvf.com/content/ICCV2023/supplemental/Croitoru_Moment_Detection_in_ICCV_2023_supplemental.pdf)) contains more details about this work.

## Table of Contents

- [BMD Dataset](#bmd-dataset)
- [YTC Dataset](#ytc-dataset)
- [Code and Models](#code-and-models)

---

## BMD Dataset

The BMD dataset is curated for moment detection in long tutorial videos.

- **Location**: [`bmd_data/`](./bmd_data)
- **Details**: For a comprehensive description of the dataset, its structure, and annotation procedure, please refer to the [bmd_data README](./bmd_data/README.md). Within the `bmd_data/`, you can also find instructions on how to download the videos, the model weights, and the extracted features.

---

## YTC Dataset

The YTC dataset provides annotations for YouTube chapters in long tutorial videos, offering structured segmentations derived directly from YouTube.

- **Location**:[`ytc_data/`](./ytc_data/)
- **Details**: For more information about the dataset, its structure, and content, please check the [ytc_data README](./ytc_data/README.md).

---

## Code and Models

This code is based on Moment-DETR (https://github.com/jayleicn/moment_detr) and adjusted to work on long videos.


## Install dependencies

```
# create conda env
conda create --name longmoment_detr python=3.7
# activate env
conda activate longmoment_detr
# install pytorch
pip install torch==1.10.1+cu111 torchvision==0.11.2+cu111 torchaudio==0.10.1 -f https://download.pytorch.org/whl/torch_stable.html
# install other python packages
pip install tqdm==4.64.1 ipython==7.34.0 easydict==1.10 tensorboard==2.11.2 tabulate==0.9.0 scikit-learn==1.0.2 pandas==1.3.5
```

## Training

Under ``` moment_detr/scripts/ ``` you can find the training script.
The training command is:

```
bash moment_detr/scripts/longmoment_detr.sh
```

The above script will train the final model (with OSG segment generation and GPT-3 query generation), using SlowFast features for the video and GPT2-xl features for the text.

## Inference

For testing the results of a trained model the following command needs to be run

```
bash moment_detr/scripts/eval.sh --resume PATH_TO_CKPT
```
where ```PATH_TO_CKPT``` is the path to the checkpoint you want to evaluate.

## Citation

If you use this work in your research, please cite our [ICCV 2023 paper](https://openaccess.thecvf.com/content/ICCV2023/papers/Croitoru_Moment_Detection_in_Long_Tutorial_Videos_ICCV_2023_paper.pdf) ([supplement](https://openaccess.thecvf.com/content/ICCV2023/supplemental/Croitoru_Moment_Detection_in_ICCV_2023_supplemental.pdf)) as follows:

```
@inproceedings{croitoru2023moment,
  title={Moment detection in long tutorial videos},
  author={Croitoru, Ioana and Bogolin, Simion-Vlad and Albanie, Samuel and Liu, Yang and Wang, Zhaowen and Yoon, Seunghyun and Dernoncourt, Franck and Jin, Hailin and Bui, Trung},
  booktitle={Proceedings of the IEEE/CVF international conference on computer vision},
  pages={2594--2604},
  year={2023}
}
```


## License

- The code and model are licensed under the [Adobe Research License](./LICENSE.md). The license prohibits commercial use and allows non-commercial research use. 
- The dataset is licensed under the [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode) license.
