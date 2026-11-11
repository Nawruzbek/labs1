#!/bin/bash
# Скрипт активации окружения и запуска Jupyter
echo "Активация окружения gui_env..."
source ~/miniconda3/etc/profile.d/conda.sh
conda activate gui_env
echo "Запуск Jupyter Notebook..."
jupyter notebook
