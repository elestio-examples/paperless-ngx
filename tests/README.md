<a href="https://elest.io">
  <img src="https://elest.io/images/elestio.svg" alt="elest.io" width="150" height="75">
</a>

[![Discord](https://img.shields.io/static/v1.svg?logo=discord&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=Discord&message=community)](https://discord.gg/4T4JGaMYrD "Get instant assistance and engage in live discussions with both the community and team through our chat feature.")
[![Elestio examples](https://img.shields.io/static/v1.svg?logo=github&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=github&message=open%20source)](https://github.com/elestio-examples "Access the source code for all our repositories by viewing them.")
[![Blog](https://img.shields.io/static/v1.svg?color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Blog)](https://blog.elest.io "Latest news about elestio, open source software, and DevOps techniques.")

# Paperless-ngx, verified and packaged by Elestio

[Paperless-ngx](https://github.com/paperless-ngx/paperless-ngx) is a document management system that transforms your physical documents into a searchable online archive so you can keep, well, less paper.

<img src="https://github.com/elestio-examples/paperless-ngx/raw/main/paperless-ngx.png" alt="paperless-ngx" width="800">

Deploy a <a target="_blank" href="https://elest.io/open-source/paperless-ngx">fully managed Paperless-ngx</a> on <a target="_blank" href="https://elest.io/">elest.io</a> if you are interested in an open source all-in-one devops platform with the ability to manage git repositories, manage issues, and run continuous integrations.

[![deploy](https://github.com/elestio-examples/paperless-ngx/raw/main/deploy-on-elestio.png)](https://dash.elest.io/deploy?soft=paperless-ngx)

# Why use Elestio images?

- Elestio stays in sync with updates from the original source and quickly releases new versions of this image through our automated processes.
- Elestio images provide timely access to the most recent bug fixes and features.
- Our team performs quality control checks to ensure the products we release meet our high standards.

# Usage

## Git clone

You can deploy it easily with the following command:

    git clone https://github.com/elestio-examples/paperless-ngx.git

Copy the .env file from tests folder to the project directory

    cp ./tests/.env ./.env

Edit the .env file with your own values.

Create data folders with correct permissions

Run the project with the following command

    docker-compose up -d

You can access the Web UI at: `http://your-domain:6610`

## Docker-compose

Here are some example snippets to help you get started creating a container.

        version: "3.4"
        services:
        broker:
            image: docker.io/library/redis:7
            restart: unless-stopped
            volumes:
            - redisdata:/data

        db:
            image: docker.io/library/mariadb:10
            restart: unless-stopped
            volumes:
            - dbdata:/var/lib/mysql
            environment:
            MARIADB_HOST: paperless
            MARIADB_DATABASE: paperless
            MARIADB_USER: paperless
            MARIADB_PASSWORD: paperless
            MARIADB_ROOT_PASSWORD: paperless

        webserver:
            image: elestio4test/paperless-ngx:${SOFTWARE_VERSION_TAG}
            restart: unless-stopped
            depends_on:
            - db
            - broker
            ports:
            - "172.17.0.1:8000:8000"
            healthcheck:
            test: ["CMD", "curl", "-f", "http://172.17.0.1:8000"]
            interval: 30s
            timeout: 10s
            retries: 5
            volumes:
            - data:/usr/src/paperless/data
            - media:/usr/src/paperless/media
            - ./export:/usr/src/paperless/export
            - ./consume:/usr/src/paperless/consume
            env_file: .env
            environment:
            PAPERLESS_REDIS: redis://broker:6379
            PAPERLESS_DBENGINE: mariadb
            PAPERLESS_DBHOST: db
            PAPERLESS_DBUSER: paperless # only needed if non-default username
            PAPERLESS_DBPASS: paperless # only needed if non-default password
            PAPERLESS_DBPORT: 3306


        volumes:
        data:
        media:
        dbdata:
        redisdata:

### Environment variables

|       Variable       | Value (example) |
| :------------------: | :-------------: |
| SOFTWARE_VERSION_TAG |     latest      |
| PAPERLESS_SECRET_KEY |   your_secret   |
|     ADMIN_EMAIL      |  test@mail.com  |
|    ADMIN_PASSWORD    |    password     |
|     PAPERLESS_URL    |    http://url   |

# Maintenance

## Logging

The Elestio Paperless-ngx Docker image sends the container logs to stdout. To view the logs, you can use the following command:

    docker-compose logs -f

To stop the stack you can use the following command:

    docker-compose down

## Backup and Restore with Docker Compose

To make backup and restore operations easier, we are using folder volume mounts. You can simply stop your stack with docker-compose down, then backup all the files and subfolders in the folder near the docker-compose.yml file.

Creating a ZIP Archive
For example, if you want to create a ZIP archive, navigate to the folder where you have your docker-compose.yml file and use this command:

    zip -r myarchive.zip .

Restoring from ZIP Archive
To restore from a ZIP archive, unzip the archive into the original folder using the following command:

    unzip myarchive.zip -d /path/to/original/folder

Starting Your Stack
Once your backup is complete, you can start your stack again with the following command:

    docker-compose up -d

That's it! With these simple steps, you can easily backup and restore your data volumes using Docker Compose.

# Links

- <a target="_blank" href="https://github.com/paperless-ngx/paperless-ngx">Paperless-ngx Github repository</a>

- <a target="_blank" href="https://docs.paperless-ngx.com/">Paperless-ngx documentation</a>

- <a target="_blank" href="https://github.com/elestio-examples/paperless-ngx">Elestio/Paperless-ngx Github repository</a>
