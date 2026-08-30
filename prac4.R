%%R
# Install rpy2 to bridge Python and R
# !pip install rpy2

# Install the R kernel for Jupyter
# !R -e "install.packages('IRkernel')"
# !R -e "IRkernel::installspec()"

# ============================================================
# ASSIGNMENT 4 - R PROGRAMMING
# IMAGE RECOGNITION AND CLASSIFICATION USING KERAS
# ============================================================


# ------------------------------------------------------------
# 1. INSTALL AND LOAD REQUIRED PACKAGES
# ------------------------------------------------------------

# Install Keras
install.packages("keras")

# Install BiocManager if not already installed
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

# Install EBImage
BiocManager::install("EBImage")

# Load packages
library(EBImage)
library(keras)


# ------------------------------------------------------------
# 2. READ IMAGES
# ------------------------------------------------------------

# Set the working directory to the folder containing images
# CHANGE THIS PATH TO YOUR OWN FOLDER PATH

setwd("C:/Users/YourName/Desktop/Assignment4")

# Image files
pics <- c(
  "p1.jpg",
  "p2.jpg",
  "p3.jpg",
  "p4.jpg",
  "p5.jpg",
  "p6.jpg",
  "c1.jpg",
  "c2.jpg",
  "c3.jpg",
  "c4.jpg",
  "c5.jpg",
  "c6.jpg"
)

# Create an empty list
mypic <- list()

# Read all 12 images
for (i in 1:12) {
  mypic[[i]] <- readImage(pics[i])
}


# ------------------------------------------------------------
# 3. EXPLORE THE IMAGES
# ------------------------------------------------------------

# Print first image
print(mypic[[1]])

# Display first image
display(mypic[[1]])

# Display eighth image
display(mypic[[8]])

# Summary of first image
summary(mypic[[1]])

# Histogram of twelfth image
hist(mypic[[12]])

# Structure of image list
str(mypic)


# ------------------------------------------------------------
# 4. RESIZE IMAGES
# ------------------------------------------------------------

# Resize all images to 28 x 28
for (i in 1:12) {
  mypic[[i]] <- resize(mypic[[i]], 28, 28)
}

# Check structure after resizing
str(mypic)


# ------------------------------------------------------------
# 5. RESHAPE IMAGES
# ------------------------------------------------------------

# Number of input features
28 * 28 * 3

# Reshape each image to 28 x 28 x 3
for (i in 1:12) {
  mypic[[i]] <- array_reshape(
    mypic[[i]],
    c(28, 28, 3)
  )
}

# Check structure
str(mypic)


# ------------------------------------------------------------
# 6. CREATE TRAINING DATA
# ------------------------------------------------------------

# Start with empty training dataset
trainx <- NULL

# Add p1 to p5
for (i in 1:5) {
  trainx <- rbind(
    trainx,
    mypic[[i]]
  )
}

# Add c1 to c5
for (i in 7:11) {
  trainx <- rbind(
    trainx,
    mypic[[i]]
  )
}

# Check training data structure
str(trainx)


# ------------------------------------------------------------
# 7. CREATE TESTING DATA
# ------------------------------------------------------------

# p6 = class 0
# c6 = class 1

testx <- rbind(
  mypic[[6]],
  mypic[[12]]
)


# ------------------------------------------------------------
# 8. CREATE CLASS LABELS
# ------------------------------------------------------------

# 0 = first image class
# 1 = second image class

trainy <- c(
  0, 0, 0, 0, 0,
  1, 1, 1, 1, 1
)

testy <- c(
  0,
  1
)


# ------------------------------------------------------------
# 9. ONE-HOT ENCODING
# ------------------------------------------------------------

trainLabels <- to_categorical(trainy)

testLabels <- to_categorical(testy)

# Display encoded labels
trainLabels

testLabels


# ------------------------------------------------------------
# 10. BUILD THE NEURAL NETWORK MODEL
# ------------------------------------------------------------

model <- keras_model_sequential()


model %>%

  # First hidden layer
  layer_dense(
    units = 256,
    activation = "relu",
    input_shape = c(2352)
  ) %>%

  # Second hidden layer
  layer_dense(
    units = 128,
    activation = "relu"
  ) %>%

  # Output layer
  layer_dense(
    units = 2,
    activation = "softmax"
  )


# Display model architecture
summary(model)


# ------------------------------------------------------------
# 11. COMPILE THE MODEL
# ------------------------------------------------------------

model %>%

  compile(
    loss = "categorical_crossentropy",
    optimizer = optimizer_rmsprop(),
    metrics = c("accuracy")
  )


# ------------------------------------------------------------
# 12. TRAIN THE MODEL
# ------------------------------------------------------------

history <- model %>%

  fit(
    trainx,
    trainLabels,
    epochs = 30,
    batch_size = 32,
    validation_split = 0.2
  )


# ------------------------------------------------------------
# 13. PLOT TRAINING HISTORY
# ------------------------------------------------------------

plot(history)


# ------------------------------------------------------------
# 14. EVALUATE MODEL ON TRAINING DATA
# ------------------------------------------------------------

model %>%
  evaluate(
    trainx,
    trainLabels
  )


# ------------------------------------------------------------
# 15. PREDICT TRAINING DATA
# ------------------------------------------------------------

pred <- model %>%
  predict_classes(trainx)


# Display predicted vs actual classes
table(
  Predicted = pred,
  Actual = trainy
)


# ------------------------------------------------------------
# 16. PREDICTION PROBABILITIES
# ------------------------------------------------------------

prob <- model %>%
  predict_proba(trainx)


# Display probabilities
prob


# Display probabilities, predicted class and actual class
cbind(
  prob,
  Predicted = pred,
  Actual = trainy
)


# ------------------------------------------------------------
# 17. EVALUATE MODEL ON TEST DATA
# ------------------------------------------------------------

model %>%
  evaluate(
    testx,
    testLabels
  )


# ------------------------------------------------------------
# 18. PREDICT TEST DATA
# ------------------------------------------------------------

test_pred <- model %>%
  predict_classes(testx)


# Display predicted and actual test classes
table(
  Predicted = test_pred,
  Actual = testy
)


# ------------------------------------------------------------
# 19. TEST PREDICTION PROBABILITIES
# ------------------------------------------------------------

test_prob <- model %>%
  predict_proba(testx)


# Display test probabilities
test_prob


# Display complete test prediction information
cbind(
  test_prob,
  Predicted = test_pred,
  Actual = testy
)


# ------------------------------------------------------------
# 20. DISPLAY TEST IMAGES
# ------------------------------------------------------------

display(mypic[[6]])

display(mypic[[12]])


# ------------------------------------------------------------
# 21. FINAL RESULTS
# ------------------------------------------------------------

cat("\n============================================\n")
cat("IMAGE CLASSIFICATION RESULTS\n")
cat("============================================\n")

cat("\nTraining Predictions:\n")
print(
  table(
    Predicted = pred,
    Actual = trainy
  )
)

cat("\nTest Predictions:\n")
print(
  table(
    Predicted = test_pred,
    Actual = testy
  )
)

cat("\nTest Prediction Probabilities:\n")
print(test_prob)

cat("\n============================================\n")
cat("MODEL COMPLETED SUCCESSFULLY\n")
cat("============================================\n")