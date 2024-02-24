import pandas as pd
import os
import glob
import matplotlib.pyplot as plt
user_key= 23502

def plot_all_csv_pressure():
    path = os.getcwd()
    csv_files = glob.glob(os.path.join(path, '*.csv'))
    
    fr f in csv_files:
        storm = pd.read_csv(f)
        storm['Pressure'].plot()
        plt.show()
		
def plot_all_csv_intensity():
    path = os.getcwd()
    csv_files = glob.glob(os.path.join(path, '*.csv'))
    
    for f in csv_files:
        storm = pd.read_csv(f)
        storm['Intensity'].plot()
        plt.show()
