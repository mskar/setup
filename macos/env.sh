conda create -yc conda-forge -n py python=3.8 joblib jupyterlab matplotlib numpy pandas scikit-learn scipy

conda create -yc conda-forge -n r rstudio r-essentials r-tidymodels r-tidyverse

conda activate py

jupyter labextension install jupyterlab_vim

conda deactivate
