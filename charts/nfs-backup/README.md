# NFS Backup Chart


## Installing the Chart

This will install a CronJob object to periodically back up user NFS home directories to an S3 bucket.

To install:

```bash
$ helm upgrade nfs-backup charts/nfs-backup -f chart-env-config/ENV/nfs-backup.yml --install
```

The job's status can be viewed with `kubectl get cronjobs`

## Configuration

Listing only the required params here.

| Parameter             | Description                   | Default |
| --------------------- | ----------------------------- | ------- |
| `AWS.IAMRole`         | IAM role for container        | ``      |
| `AWS.S3.BucketName`   | Name of destination S3 bucket | ``      |

### S3 Notes

The specified IAM Role requires an IAM policy relevant access to the S3 bucket:

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:DeleteObject",
                "s3:AbortMultipartUpload"
            ],
            "Resource": "arn:aws:s3:::BUCKET_NAME/*"
        },
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:GetBucketLocation"
            ],
            "Resource": "arn:aws:s3:::BUCKET_NAME"
        }
    ]
}
```

The IAM policy must also have a trust relationship with the Kubernetes worker nodes so that the role can be assumed by the container:

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    },
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::ACCOUNT_NUMBER:role/WORKER_ROLE_NAME"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
```
