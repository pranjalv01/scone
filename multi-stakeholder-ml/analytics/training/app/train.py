# https://www.tensorflow.org/tutorials/images/cnn

import tensorflow as tf
from tensorflow.keras import datasets, layers, models

# Verify hardware
physical_devices = tf.config.experimental.list_physical_devices('CPU')
print(physical_devices)

# Load data
(train_images, train_labels), (test_images,
                               test_labels) = datasets.cifar10.load_data(cache_dir="/encrypted-input")

class_names = ['airplane', 'automobile', 'bird', 'cat', 'deer',
               'dog', 'frog', 'horse', 'ship', 'truck']

# Build Neural network
model = models.Sequential()
model.add(layers.Conv2D(32, (3, 3), activation='relu', input_shape=(32, 32, 3)))
model.add(layers.MaxPooling2D((2, 2)))
model.add(layers.Conv2D(64, (3, 3), activation='relu'))
model.add(layers.MaxPooling2D((2, 2)))
model.add(layers.Conv2D(64, (3, 3), activation='relu'))


model.add(layers.Flatten())
model.add(layers.Dense(64, activation='relu'))
model.add(layers.Dense(10))

# Train
config = tf.compat.v1.ConfigProto(device_count={'CPU': 16})
sess = tf.compat.v1.Session(config=config)
with sess.as_default():
    model.compile(optimizer='adam',
                  loss=tf.keras.losses.SparseCategoricalCrossentropy(
                      from_logits=True),
                  metrics=['accuracy'])

    history = model.fit(train_images, train_labels, epochs=1,
                        validation_data=(test_images, test_labels))
    model.save("/encrypted-output/cifar-model")
    test_loss, test_acc = model.evaluate(test_images,  test_labels, verbose=2)
print(test_acc)
# Test
with open("/encrypted-output/note.txt", 'w') as f:
    f.write("Cifar10 Model!")


