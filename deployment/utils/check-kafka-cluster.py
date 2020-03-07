"""
This is a script to check the operation of the Kafka cluster with AdminClient from confluent-kafka.
Reference:  https://github.com/confluentinc/confluent-kafka-python/blob/master/examples/adminapi.py
"""

from confluent_kafka.admin import AdminClient, NewTopic
import pprint

# create admin client
admin = AdminClient({'bootstrap.servers': 'kafka-cluster:9092'})

# create topic
new_topic = NewTopic('ckp-test-topic', num_partitions=1, replication_factor=1)
create_dict_futures = admin.create_topics([new_topic])

# check if topic is created
for c_topic, c_future in create_dict_futures.items():
    try:
        c_future.result()
        print('Topic {} successfully created'.format(c_topic))
    except Exception as e:
        print('Failed to create topic {}: {}'.format(c_topic, e))

# retrieve cluster metadata
cluster_metadata = admin.list_topics()

# list topic details
dict_topics = cluster_metadata.topics
topic_metadata = dict_topics['ckp-test-topic']
dict_topic_partitions = topic_metadata.partitions
partition0_metadata = dict_topic_partitions[0]
p_id = partition0_metadata.id
p_leader = partition0_metadata.leader
p_replicas = partition0_metadata.replicas
p_isrs = partition0_metadata.isrs

print('\nTopic Details:')
print('  Partition ID: {}'.format(p_id))
print('  Leader: {}'.format(p_leader))
print('  Replicas: {}'.format(p_replicas))
print('  In-Sync Replicas: {}'.format(p_isrs))

# list brokers details
dict_brokers = cluster_metadata.brokers
controller_id = cluster_metadata.controller_id
print('\nBrokers:')
pprint.pprint(dict_brokers)
print('\nCluster Controller: {}\n'.format(controller_id))

# delete topic
delete_dict_futures = admin.delete_topics(['ckp-test-topic'], operation_timeout=30)

# check if topic is deleted
for d_topic, d_future in delete_dict_futures.items():
    try:
        d_future.result()
        print('Topic {} successfully deleted'.format(d_topic))
    except Exception as e:
        print('Failed to delete topic {}: {}'.format(d_topic, e))
