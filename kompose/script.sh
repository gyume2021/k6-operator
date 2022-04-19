## Create jmeter database automatically in Influxdb

echo "Creating Influxdb Database"

##Wait until Influxdb Deployment is up and running
##influxdb_status=`kubectl get po -n $tenant | grep influxdb-jmeter | awk '{print $2}' | grep Running

influxdb_pod=`kubectl get po -n k6-operator-system | grep influxdb | awk '{print $1}'`
kubectl exec -ti -n k6-operator-system $influxdb_pod -- influx -execute 'CREATE DATABASE k6'

# kubectl exec $(kubectl get pod -l app=influxdb-jmeter -n jan -o name) -n jane -- influx -execute 'SHOW DATABASES'
# kubectl exec -it $(kubectl get pod -l app=influxdb-jmeter -n jane -o jsonpath='{.items[0].metadata.name}') -n jane -- sh

# # login to the Influx CLI.
# influx -precision rfc3339
# use k6

# # list of all databases on instance
# SHOW DATABASES
# influx -execute 'SHOW DATABASES'
# SHOW FIELD KEYS on k6
# select startedT, endedT, last(countError) from k6 limit 10
# SHOW MEASUREMENTS on k6
# SHOW RETENTION POLICY on k6
# SELECT sum("countError")  / sum("count") FROM "$retention"."k6" WHERE "application" =~ /$app$/ AND "transaction" = 'all' AND $timeFilter
