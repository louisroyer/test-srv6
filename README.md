# SRV6 test

## `/etc/docker/daemon.json`
```json
{
	"storage-driver": "btrfs",
	"ipv6": true,
	"fixed-cidr-v6": "fd00:d0cc:e700:defa::/64",
	"default-address-pools": [
		{
			"base": "10.0.0.0/8",
			"size": 24
		},
		{
			"base": "fd00:d0cc:e700:1111::/64",
			"size": 80
		}
	]
}
```

Note: cannot configure default address pool for ipv6 to `{base: "fd00:d0cc:e7::/48", "size":64}` because of [moby/moby#42801](https://github.com/moby/moby/issues/42801).


## ping T1 from C1 

```text
$ docker exec -it c1 bash
root@c1:/# ping 10.0.2.21
```


