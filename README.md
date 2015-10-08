# ansible-aws-simple
quick, generic playbook to spin up ec2 nodes

## Usage:

Configure boto ( ~/.boto ) or:

	export AWS_ACCESS_KEY_ID=<key>
	export AWS_SECRET_ACCESS_KEY=<secret>

Modify example.json


	{
		"set_name": "example-name",
		"aws_env": "example-env",
		"region": "us-east-1",
		"instance_type": "t2.medium",
		"ami": "ami-21630d44",
		"count": 3
	}

* ```set_name```: name of group of nodes (within VPC)
* ```aws_env```: name of vpc

( theoretically allowing more sets of nodes in the same vpc )


Provision VPC and nodes

	ansible-playbook provision.yml -e @example.json

De-provision nodes:

	ansible-playbook deprovision.yml -e @example.json

## Features:

* Makes ec2 VPC, group, key, and provisions nodes
* Adds names to nodes as <set_name>-<node_number>
* Adds node names to ssh config ( using included config.sh/config.d setup in ssh )
* Adds node names to inventory file under <set_name> group

## TODO :
* Add VPC de-provision script ( currently commented out in deprovision.yml )
* Handle adding more nodes to current set ( uses ```ami_instance_index``` to name, so adding more names will probably cause hostname collision
* Use something better than json