#!/usr/bin/env bash

# kubectl portforward
kubectl_portforward() {
	echo "forward:" $1 $2 $3
	kubectl port-forward $1 $2:$3
}

# array of services needing to forward port
declare -a services=(
	"mongo-primary-0:27017:27017"
	"redis-master-0:6379:6379"
	"postgres-primary-0:5432:5432"
	"vault-0:8200:8200"
	"minio-public-snsd-6dfc4c4567-rpln4:39655:39655"
	"whatsapp-archived-gateway-6b775c57bb-ggp46:9005:9006"
	"whatsappintegration-archived-f498d7c5c-dppm6:9006:9006"
	"waa-gateway-coordinator-789d9f967d-ktt7h:9004:9006"
	"synapse-6fbc7cd5b7-mjv2l:8008:8008"
)

# run kubectl port-forward command
declare -a PIDs
for service in ${services[@]}; do
	params=(${service//:/ })
	(kubectl_portforward ${params[0]} ${params[1]} ${params[2]}) &
	PIDs+=($!)
done

# print list PIDs of background processes
printf "PIDs:"
printf '%s ' ${PIDs[@]}
printf '\n'

# killing background processes
kill_bgprocess() {
	local PIDS=$@
	for id in ${PIDs[@]}; do
		kill $id
	done
}
trap "kill_bgprocess $PIDs" SIGINT

# waiting background processes
for id in ${PIDs[@]}; do
	wait $id
done
