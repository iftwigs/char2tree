# char2tree
project by 2nd year Master's students of Computational Linguistics department, HSE

Char2tree is a tool for joint segmenting, tagging, and parsing sentences in Universal Dependencies format.  The project was developed by Nikita Sykhrannov, Karina Mischenkova, and Elizaveta Ezhergina (2nd year Master's students of Computational Linguistics department, HSE) under the mentorship of Francis Tyers, PhD.

Currently available models operate for several languages including Amguema dialect of Chukchi (courtesy of chuklang.ru), Japanese, and Chinese, however it is possible to train a new model on any language. To run training, create or choose a configuration file that encodes the model's hyperparameters such as the tasks you want the model to solve (any of the three tasks can be switched on and off), the number of parameters in the layers, and regularization. Then open the repository's directory in the Terminal and type:

``allennlp train <CONFIG_PATH> -s <SERIALIZATION_DIR> --include-package modules``

Furthermore, you can use the training_example.ipynb notebook as reference.

Our approach is inspired by A Graph-based Model for Joint Chinese Word Segmentation and Dependency Parsing, a 2019 paper by Hang Yan, Xipeng Qiu, and Xuanjing Huang. Some of the core parts of the model's code were adapted from their open-sourced code for the paper, available at https://github.com/fastnlp/JointCwsParser. The resulting architecture is similar to the one implemented in the paper An improved neural network model for joint POS tagging and dependency parsing by Dat Quoc Nguyen and Karin Verspoor (the code is available at https://github.com/datquocnguyen/jPTDP, it's written in a deep learning framework called dynet).

The important feature that distinguishes our work from those related works is the format of data annotation for incorporating languages that we've developed for the Chukchi treebank. Moreover, the data for the Chukchi treebank was annotated manually by our team members Karina Mischenkova and Francis Tyers. It appears to be the first annotation of incorporation in a language using the Universal Dependencies. The problem of dependency annotation in polysynthetic languages is discussed in detail in the article [Tyers, Mishchenkova 2020]. 

The dataset was developed on the corpus of spoken Chukchi in the Amguema variant. Its volume is 65 texts, 6112 tokens, and 1004 sentences. The type-token ratio (TTR) is 50.26%. The original morphological annotation was revised, corrected and converted to the CoNLL-U format with the addition of POS tags. The dataset was enriched with syntactic dependency annotation. 
