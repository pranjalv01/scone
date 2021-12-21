#https://www.tensorflow.org/tutorials/keras/save_and_load
import tensorflow as tf
from tensorflow.keras import models
from tensorflow.keras.preprocessing import image

import numpy as np

import sys

print(tf.__version__)

# Get path from input argv
model_path = sys.argv[1]
image_path = sys.argv[2]

# Test reading encrypted volume
with open("/encrypted-output/note.txt", 'r') as f:
    content = f.read()
    print(content)

# Load model from encrypted-output volume
model = tf.keras.models.load_model(model_path, compile=False)
#model.summary()


# Load and perform formating an input image
# reqiure: pip install pillow
input_image = image.load_img(image_path, target_size=(32, 32))
input_image = image.img_to_array(input_image)
input_image = np.expand_dims(input_image, axis=0)

# Use the trained model to classify an image
prediction_out = model.predict_classes(input_image)
print(prediction_out)
if prediction_out[0]==0:
    print("Aeroplane")
elif prediction_out[0]==1:
    print('Automobile')
elif prediction_out[0]==2:
    print('Bird')
elif prediction_out[0]==3:
    print('Cat')
elif prediction_out[0]==4:
     print('Deer')
elif prediction_out[0]==5:
    print('Dog')
elif prediction_out[0]==6:
    print('Frog')
elif prediction_out[0]==7:
    print('Horse')
elif prediction_out[0]==8:
    print('Ship')
elif prediction_out[0]==9:
    print('Truck')
else:
    print('Error')