from diagrams import Cluster, Diagram
from diagrams.aws.compute import ECS
from diagrams.aws.database import ElastiCache, RDS
from diagrams.aws.network import ELB
from diagrams.aws.network import Route53
from diagrams.gcp.iot import IotCore
from diagrams.onprem.client import Client
from diagrams.onprem.client import User


with Diagram("YOSEF_LAB", show=False):
    HTTPS =Client("HTTPS")
    LB = ELB("LB")
    SSH = User("SSH")

    with Cluster("HA"):
        Backend_Apps = [RDS("APP1"),
                     RDS("APP2")]

    HTTPS >> LB >> Backend_Apps
    SSH >> LB


