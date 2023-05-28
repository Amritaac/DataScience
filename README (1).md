
# Event streaming using KAFKA

Business Problem :
Financial market companies each moment have received billions of data for different type of stocks , the ever changing highs and lows of the stock prices. So , real time event streaming is the only way to handle huge amount of different data . 
As a solution many companies are now using Kafka real time event streaming technology as a data pipeline .



## Documentation
TOOLS USED

S3 (Simple Storage Service) -
Amazon Simple Storage Service (Amazon S3) is an object storage service that offers industry-leading scalability, data availability, security, and performance. You can use Amazon S3 to store and retrieve any amount of data at any time, from anywhere.

Athena

Amazon Simple Storage Service (Amazon S3) is an object storage service that offers industry-leading scalability, data availability, security, and performance. You can use Amazon S3 to store and retrieve any amount of data at any time, from anywhere.

Glue Crawler

a crawler can populate the AWS Glue Data Catalog with tables. A crawler can crawl multiple data stores in a single run. Upon completion, the crawler creates or updates one or more tables in your Data Catalog. Extract, transform, and load (ETL) jobs that you define in AWS Glue use these Data Catalog tables as sources and targets. The ETL job reads from and writes to the data stores that are specified in the source and target Data Catalog tables.

Glue Catalog

AWS Glue provides a console and API operations to set up and manage your extract, transform, and load (ETL) workload.
AWS Glue uses the AWS Glue Data Catalog to store metadata about data sources, transforms, and targets. One can then use the metadata to query and transform that data in a consistent manner across a wide variety of applications.

EC2

An Amazon EC2 instance is a virtual server in Amazon's Elastic Compute Cloud (EC2) for running applications on the Amazon Web Services (AWS) infrastructure

KAFKA

event streaming is the practice of capturing data in real-time from event sources like databases, sensors, mobile devices, cloud services, and software applications in the form of streams of events; storing these event streams durably for later retrieval; manipulating, processing, and reacting to the event streams in real-time as well as retrospectively; and routing the event streams to different destination technologies as needed.
APPLICATIONS:
To process payments and financial transactions in real-time, such as in stock exchanges, banks, and insurances.

To track and monitor cars, trucks, fleets, and shipments in real-time, such as in logistics and the automotive industry.

To continuously capture and analyze sensor data from IoT devices or other equipment, such as in factories and wind parks.

To collect and immediately react to customer interactions and orders, such as in retail, the hotel and travel industry, and mobile applications.

To monitor patients in hospital care and predict changes in condition to ensure timely treatment in emergencies.

To connect, store, and make available data produced by different divisions of a company.

To serve as the foundation for data platforms, event-driven architectures, and microservices.

HOW KAFKA WORKS?

To publish (write) and subscribe to (read) streams of events, including continuous import/export of your data from other systems.
To store streams of events durably and reliably for as long as you want.
To process streams of events as they occur


SERVER :
 Kafka is run as a cluster of one or more servers that can span multiple datacenters or cloud regions. Some of these servers form the storage layer, called the brokers
CLIENT :They allow you to write distributed applications and microservices that read, write, and process streams of events in parallel, at scale, and in a fault-tolerant manner even in the case of network problems or machine failures

AWS CLI
Command line tool of AWS for writing script.

Jupyter Notebook

For writing producer and consumer code and generate random events from the static dataset extracted from Yahoo.finance website.






## Deployment

To deploy this project run

```bash
  npm run deploy
```


## DATASET


https://finance.yahoo.com/

Segments of data extracted from above link used in this project. FRom this static csv dataset with the help of python programming ausing loop and sleep random continuous events were generated . That event stream from local sytem goes to kafka in AWS instance.




##DATA FLOW

- From Yahoo data using python program generate random continuous data
- Create Ec2 instance
download JVM
Connect ec2 via ssh and install zookeeper, kafka and start those.
Write program for producer in JUPYTER notebook and create topic.

Convert data to json and run a loop for random data simulation.
Write down consumer code and pass data from Producer and check if it replicate into consumer.
Then create S3 bucket to store these generated event and run Glue crawler on it.
Then all the data will go to Athena and on top of it we can query and analyse.
- 




## Acknowledgements

 - Darshil Parmar blog and youtube channel for Data Engineering
 - How to write a Good readme](https://readme.so/editor0

