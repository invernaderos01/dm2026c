#!/bin/bash
# -*- coding: utf-8 -*-

# 1. Definir variables y parámetros
FECHA=$(date +%Y%m%d_%H%M%S)
NOTEBOOK_IN="/home/ds/buckets/b1/exp/Final/z729_final_junior_D.ipynb"

#278911	278903	351217	525607	771937
#100333	300331	500333	700331	900331
#100519	100523	100537	100547	100549

Semilla=(278911 278903 351217 525607 771937 100333 300331 500333 700331 900331 100519 100523 100537 100547 100549 133711)

Metodo=("dolar_oficial" "deflacion")
for seed in ${Semilla[@]}
do
    for method in "${Metodo[@]}"
    do
        NOTEBOOK_OUT="tp_salida_${seed}_${method}.ipynb"

        echo "========================================="
        echo " Iniciando ejecución del Notebook en R a las FECHA=$(date +%Y%m%d_%H%M%S)... "
        echo " Semilla: $seed | Metodo: $method | Salida en: $NOTEBOOK_OUT"
        echo "========================================="
        
        # 2. Ejecutar Papermill
        # El flag --log-output hace que R imprima en la pantalla de la VM todo lo que hace en tiempo real
        
        papermill "$NOTEBOOK_IN" "$NOTEBOOK_OUT" \
          -p S $seed \
          -p M $method \
          --log-output
    done
done
