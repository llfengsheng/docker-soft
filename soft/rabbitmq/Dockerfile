FROM rabbitmq:3.9-management

ADD ./plugins/*.ez /plugins/

# 启动延时插件
RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange
