import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job
from awsglue import DynamicFrame


def sparkSqlQuery(glueContext, query, mapping, transformation_ctx) -> DynamicFrame:
    for alias, frame in mapping.items():
        frame.toDF().createOrReplaceTempView(alias)
    result = spark.sql(query)
    return DynamicFrame.fromDF(result, glueContext, transformation_ctx)


args = getResolvedOptions(sys.argv, ["JOB_NAME"])
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args["JOB_NAME"], args)

# Script generated for node AWS Glue Data Catalog
AWSGlueDataCatalog_node1694995902544 = glueContext.create_dynamic_frame.from_catalog(
    database="module-50",
    table_name="module_49",
    transformation_ctx="AWSGlueDataCatalog_node1694995902544",
)

# Script generated for node SQL Query
SqlQuery54 = """
SELECT 
    stories,
    parking,
    avg(price) as precio_medio
    FROM myDataSource
    group by 1,2
    order by 3;

"""
SQLQuery_node1694995911533 = sparkSqlQuery(
    glueContext,
    query=SqlQuery54,
    mapping={"myDataSource": AWSGlueDataCatalog_node1694995902544},
    transformation_ctx="SQLQuery_node1694995911533",
)

# Script generated for node Amazon S3
AmazonS3_node1694995944811 = glueContext.getSink(
    path="s3://final-result-02/",
    connection_type="s3",
    updateBehavior="LOG",
    partitionKeys=[],
    enableUpdateCatalog=True,
    transformation_ctx="AmazonS3_node1694995944811",
)
AmazonS3_node1694995944811.setCatalogInfo(
    catalogDatabase="module-50", catalogTableName="table02-parkingandstories"
)
AmazonS3_node1694995944811.setFormat("json")
AmazonS3_node1694995944811.writeFrame(SQLQuery_node1694995911533)
job.commit()
