# Image Classification Project

## 📖 Documentation

### 📌 Features Implemented
- Data Loading and Inspection
- Exploratory Data Analysis (EDA)
- Logistic Regression Classification Model
- Neural Network-based Classification Model
- Model Evaluation and Explainability

---

### 🔧 Technologies Used
- **Programming Language**: Python
- **Libraries**:
  - `pandas` - Data handling and processing
  - `numpy` - Numerical computations
  - `matplotlib` - Data visualization
  - `seaborn` - Enhanced visualizations
  - `sklearn` - Machine learning (Logistic Regression, data preprocessing, model evaluation)
  - `tensorflow/keras` - Deep learning (Neural Network implementation)

---

### 🚀 Setup Instructions
1. **Clone the repository:**
   ```bash
   git clone https://github.com/Vaibhavking8/IEEE_CS.git
   cd <project_directory>
   ```
2. **Install required dependencies:**
   ```bash
   pip install -r requirements.txt
   ```
3. **Run the cells of Jupyter Notebook**
   
4. **View results:**
   - Sample images and dataset insights will be displayed.
   - Model training and evaluation metrics will be printed.

---

## 🏆 Levels Completed

### 👞 Level 0: Data Loading and Initial Inspection
✅ Load the dataset using pandas/numpy.  
✅ Check the dataset shape and print it.  
✅ Display a few images using Matplotlib with their labels.  
✅ Verify grayscale format by checking a single image.  

### 🔰 Level 1: Exploratory Data Analysis
✅ Perform exploratory data analysis (EDA).  
✅ Load and visualize the dataset using Pandas and Matplotlib.  
✅ Display sample images from each category to understand data distribution.  
✅ Generate summary statistics for pixel values.  

### ⚡ Level 2: Basic Classification Model
✅ Develop a Logistic Regression classifier for image classification.  
✅ Preprocess and normalize the data.  
✅ Split the dataset into training and testing subsets.  
✅ Implement Logistic Regression using Scikit-Learn.  
✅ Train and evaluate model accuracy and loss metrics.  
✅ Implement Explainable AI techniques to interpret model decisions.  

### 🚀 Level 3: Neural Network Implementation
✅ Design and implement a Neural Network for image classification.  
✅ Construct input, hidden, and output layers with appropriate activation functions.  
✅ Train the model on the training dataset and validate on a separate validation set.  
✅ Evaluate accuracy and loss metrics.  

---

### 📜 Implementation Details
- **Data Preprocessing**: Normalization, reshaping, and train-test splitting.
- **Model Training**:
  - **Logistic Regression Model**: Uses `sklearn.linear_model.LogisticRegression`.
  - **Neural Network Model**: Implemented using `tensorflow.keras.models.Sequential` with multiple layers.
- **Performance Evaluation**: Accuracy, Loss metrics, and Model Explainability using feature importance.
- **Visualization**: Matplotlib is used to display image samples and classification results.

📌 *This project aims to classify images using both traditional machine learning and deep learning approaches, progressively improving model performance at each level.*

