# Firecracker Test Script

This is designed to be used with a `reignited` configuration file and mmds data and will start Firecracker manually using curl commands only.

## How to use

1. Get your `firecracker.cfg` from `/var/lib/reignited/vm/[ns]/[vmid]/firecracker.cfg` and put it in the root and name it `reignited.cfg`

2. Get the mmds parts of the original gRPC request and create a file in the root called `reignited.mmds` with the following contents:

```json
{    
    "meta-data": "BASE64ENCODED",
    "user-data": "BASE64ENCODED"
}
```
Where `BASE64ENCODED` is the encoded values from the gRPC requests.

3. You will need to have be running on the same machine as reignited to have the same block devices/files available. **optional** If you aren't then run `98-get-images.sh` to download ubuntu cloud images/kernel/initrd.

4. Open 2 command windows.

5. In the first command window run the following commands in order:
    a. `0-create-configs.sh`
    b. `1-start_firecracker.sh`

6. **optional** If you are on a different machine to reignited create any macvtap interfaces and then edit the files in `/cfg` to use the downloaded images.

7. In the second command window run the following commands in order:
    a. `2-config-microvm.sh`
    b. `3-config-mmds.sh`
    c. `4-start-microvm.sh`

This will start firecracker running.