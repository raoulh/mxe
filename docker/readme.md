## Docker

### How to build the docker image?

```bash
cd docker
mkdir -p mxe_mingw_qt5

#Copy mxe code into temporary folder (this is to prevent transfering too many data into the docker build context)
rsync -avp ../* ../.* mxe_mingw_qt5/

#build image (replace xxxxxx with version tag)
docker build -t docker.emc-partner.ch/ee/tools/mxe_mingw_qt5:xxxxxx .

#push image to registry (replace xxxxxx with version tag)
docker push docker.emc-partner.ch/ee/tools/mxe_mingw_qt5:xxxxxx
```
