
# Handwritten Greek Character Classification 

Different models can be used to build a machine learning system capable of
performing a character classification task. One of the classification tasks most often
used as a benchmark for classification models is character recognition. This report
describes a comparison among these different models, trained on a dataset of
modern greek handwritten letters, with different hyperparameters and optimization
features. It is well known that Convolutional Neural Networks (CNN) perform the
best in image classification tasks, however, reaching high accuracy scores also
requires hyperparameter tuning and strategies to solve high variance. Using these
optimizations, the best model trained in the experiments reaches an accuracy score
of up to 94%.


## Acknowledgements

 - Margaronis, John, et al. "GCDB: a character database system." Proceedings of the International Workshop on Multilingual OCR. 2009.
 - Russell, Stuart J. Artificial intelligence a modern approach. Pearson Education,Inc., 2010.
 - Sokolova, Marina, and Guy Lapalme. "A systematic analysis of performance measures for classification tasks." Information processing & management 45.4(2009): 427-437.
- LeCun, Yann, et al. "Gradient-based learning applied to document recognition."
Proceedings of the IEEE 86.11 (1998): 2278-2324.
- Hinton, Geoffrey E., et al. "Improving neural networks by preventing co-adaptation of feature detectors." arXiv preprint arXiv:1207.0580 (2012).
- Kingma, Diederik P., and Jimmy Ba. "Adam: A method for stochastic optimization." arXiv preprint arXiv:1412.6980 (2014).
- Vamvakas, G., et al. "Greek Handwritten character recognition." Proceedings of the 11th Panhellenic Conference in Informatics. 2007.
## Dataset

[Dataset](https://www.kaggle.com/datasets/vrushalipatel/handwritten-greek-characters-from-gcdb)


## Installation

Install 
- numpy
- matplotlib
- scikit-learn
- tensorflow

## Importing Libraries

To deploy this project run

```bash
import os
import random
import itertools

import cv2
import numpy as np
import matplotlib.pyplot as plt
from sklearn.metrics import confusion_matrix

import tensorflow as tf
from tensorflow.keras.utils import to_categorical
from tensorflow.keras.models import Model, Sequential
from tensorflow.keras.layers import Conv2D, MaxPooling2D, Flatten, Dense, BatchNormalization, Activation, Dropout
from tensorflow.keras.regularizers import l2
from tensorflow.keras.callbacks import ReduceLROnPlateau, EarlyStopping
```

