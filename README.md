# Data-Mining-R-Project 
![a](https://user-images.githubusercontent.com/36234545/59024439-9208df80-885a-11e9-8e86-ec5f1bcc63e5.png)

## Aim of the Project
The purpose of this data mining project is to better understand the victims killed by police in the year 2015 in the United States and to understand how they died and for what reason they were killed. As we know from certain sources The United States has much more police murder rates than similar Western murder countries. Keeping this fact in mind, we will try to clarify this subject according to the information in the data. These higher rates may have a particular focus on race and ethnicity, and how this variable has changed the possibility of being a victim of police murders. We will use classification and clustering methods for this purpose.
I Analyzed the data provided with the feature descriptions provided using R language.

This project contains following steps;

**1. Data Preprocessing**<br>
-> Preprocess the data (handle missing values, noise etc.). Plot data by using proper data
visualizations. (histograms, scatter plot, mosaic plot etc)

**2. Feature Selection and Dimentionality of Reduction**<br>
-> Choose features that are important for the analysis.

**3. Applying Clustering Algorithms**<br>
-> Applying apropriate clustering algorithms such as K-means and Hierarchial Clustering(Agglomeration) methods to generate clusters. Choose best cluster number. At the
end of the process each record will have a cluster label. Analyze properties of each cluster.

**4. Applying Classification Algorithms**<br>
->Apply classification algorithms such as Decision Trees and Artificial Neural Network(ANN) to generate a model to classify the cluster label.

**You can get the dataset from following link;**<br>
https://www.kaggle.com/fivethirtyeight/fivethirtyeight-police-killings-dataset

**Some Examples From Mining Process;**<br><br>

**Data Analysis (Race Attribute)**<br>
![655161fd06c272f215adce273aeefc9f](https://user-images.githubusercontent.com/36234545/59024558-d5634e00-885a-11e9-86e1-3bf4e488c346.png)

**Missing Data Profile**<br>
![8db70d0a17501797c7db4bfe724ba264](https://user-images.githubusercontent.com/36234545/59024619-f3c94980-885a-11e9-95c3-b0c4ad125d8f.png)

**Handling with Missing Data**<br>
![c94ae3907342b1952fdd7955549409d5](https://user-images.githubusercontent.com/36234545/59024876-8964d900-885b-11e9-8fa7-8c7a400777bf.png)<br>

![d3187aed46db9da6e2c523b6633828f2](https://user-images.githubusercontent.com/36234545/59024972-c4670c80-885b-11e9-97a5-c665c649deec.png)

**Rounding Attributes**<br>
![09576ec1fd79f81887760ba46fbcb339](https://user-images.githubusercontent.com/36234545/59024927-ad281f00-885b-11e9-9fac-8fc7c45cefaa.png)

**->Correlation Matrix(Initial)**<br>
![3e24e40577c055ae88083322df04602a](https://user-images.githubusercontent.com/36234545/59022505-8ddac300-8856-11e9-80ce-ba929ecb8cc6.png)

**Removing Unnecessary Attributes**<br>
![46f1c37256f82f5b1bece97288589cb0](https://user-images.githubusercontent.com/36234545/59025113-1dcf3b80-885c-11e9-92fe-a86f9481e150.png)

**->Correlation Matrix(After Cleaning :)**<br>
![süper](https://user-images.githubusercontent.com/36234545/59024135-ebbcda00-8859-11e9-9a6f-acaf2bac53e2.png)

**Converting Categorical Attributes to Numeric**<br>
![dd22e171ba32332a792b56999c38152e](https://user-images.githubusercontent.com/36234545/59025015-dea0ea80-885b-11e9-92a9-9fd3e8689459.png)

**Feature Selection / Dimentionality Reduction**<br>

  **-> Random Forest**<br>
  ![b8c681db1465b0bfc9a84477ccb13871](https://user-images.githubusercontent.com/36234545/59025218-5bcc5f80-885c-11e9-8806-ed8b90c25ed7.png)<br>
  
  **->Recursive Forest Elimination (RFE)**<br>
  ![rec](https://user-images.githubusercontent.com/36234545/59025301-89190d80-885c-11e9-96de-d2c784809a98.png)<br>
  
  **->Principal Component Analysis(PCA)**<br>
  ![0484dceb84109d19dd51d9d9bf8ce4e6](https://user-images.githubusercontent.com/36234545/59025368-ae0d8080-885c-11e9-8f1a-9f3e9e4274aa.png)<br>
  
  **->Boruta Algorithm**<br>
  ![2019-06-06 13_13_32-Window](https://user-images.githubusercontent.com/36234545/59025501-fdec4780-885c-11e9-8ed1-3c46853a9a39.png)<br>
  
  **Dimensionality Reduction**<br>
  ![e5c789a0819ab766ccce40504dfc4080](https://user-images.githubusercontent.com/36234545/59025579-28d69b80-885d-11e9-9b46-9f1fec1aaafb.png)<br>

**Elbow Method to find Number of Clusters**<br>
![16c5ce24b717e22036e1cc5822fee922](https://user-images.githubusercontent.com/36234545/59023645-e317d400-8858-11e9-9aa1-9a258be887ad.png)

**K-Means Clustering**<br>
![kmeans](https://user-images.githubusercontent.com/36234545/59023432-7a305c00-8858-11e9-9912-f15a37938e0c.png)

**Hierarchial Clustering(Agglomeration Method)**<br>
![9f9ed373f2d03377b15fef527a53ea42](https://user-images.githubusercontent.com/36234545/59023629-da270280-8858-11e9-9683-ff623283a7f2.png)

**Comparison K-means and Hierarchial Clustering**<br>
**-> K-Means**<br>
![kmen](https://user-images.githubusercontent.com/36234545/59025859-c500a280-885d-11e9-8d52-d732e5d372b6.png)<br>

**-> Hierarchial Clustering**<br>
![hie](https://user-images.githubusercontent.com/36234545/59025858-c500a280-885d-11e9-9e0d-e92b23bf60a4.png)<br>

**Artificial Neural Network(ANN)**<br>
![0fde64488e6204e311aa831ede25f463](https://user-images.githubusercontent.com/36234545/59022479-83b8c480-8856-11e9-8a10-24ecbba90311.png)<br>

**Decision Trees(DT)**<br>
![2019-05-30 02_36_26-tree pdf - Foxit Reader](https://user-images.githubusercontent.com/36234545/59024047-b3b59700-8859-11e9-8241-c646cef3130e.png)<br>





**CONCLUSION**<br>
During this project, I think that we have gained a lot of things in this field because we did a lot of research on behalf of data mining. Although we can not get exact results we are still doing a lot of research, we have gained useful knowledge and experience. Especially, the part of preprocessing the data took most of my time. After cleaning the data properly, you can actually use only the algorithms correctly. Another result I obtained from this data is that the part of unarmed people covers covers a certain part of the data. I have learned a lot of interesting information thanks to this homework, it was a really good experiment for me.<br><br>


**REFERENCES**<br>
**[1]**  https://www.theguardian.com/us-news/ng-interactive/2015/jun/01/the-counted-police-killings-us-database<br>
The Counted is a project by the Guardian working to count the number of people killed by police and other law enforcement agencies in the United States throughout 2015 and 2016, to monitor their demographics and to tell the stories of how they died.<br><br>
 **[2]** https://www.kaggle.com/fivethirtyeight/fivethirtyeight-police-killings-dataset<br>
This web page contains the dataset behind the story Where Police Have Killed Americans In 2015. <br><br>
**[3]** https://www.kaggle.com/stevechadwick/police-killings-analysis/<br>
This web page contains the useful informations about dataset.<br><br>
**[4]** https://fivethirtyeight.com/features/where-police-have-killed-americans-in-2015/<br>
Very Nice Article Written By Ben Casselman, JUN. 3, 2015, AT 11:58 AM Where Police Have Killed Americans In 2015,
Ben Casselman is a senior editor and the chief economics writer for FiveThirtyEight. <br><br>
**[5]** https://www.analyticsindiamag.com/data-preprocessing-with-r-hands-on-tutorial/<br>
Basics of Data Preprocessing in R, The Tutorial for Beginners<br><br>
**[6]** https://cran.r-project.org/web/packages/<br>
The Official R Packages Repo, I have read many of them (especially randomForest)<br><br>
**[7]** https://www.analyticsvidhya.com/blog/2017/09/creating-visualizing-neural-network-in-r/<br>
Artificial Neural Network Example

