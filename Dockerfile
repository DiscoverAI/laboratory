FROM jupyterhub/singleuser
RUN pip install numpy pandas scikit-learn seaborn boto3
