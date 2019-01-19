FROM rabbitmq:latest

RUN apt-get update

RUN apt-get install -y curl unzip

RUN curl https://dl.bintray.com/rabbitmq/community-plugins/3.7.x/rabbitmq_delayed_message_exchange/rabbitmq_delayed_message_exchange-20171201-3.7.x.zip > $RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-20171201-3.7.x.zip

RUN unzip $RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-20171201-3.7.x.zip -d $RABBITMQ_HOME/plugins/

RUN ls $RABBITMQ_HOME/plugins

RUN rm -f $RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-20171201-3.7.x.zip

RUN rabbitmq-plugins list

RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange

RUN rabbitmq-plugins enable rabbitmq_consistent_hash_exchange

RUN rabbitmq-plugins enable rabbitmq_management

