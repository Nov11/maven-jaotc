package pkg;

import io.lettuce.core.*;
import io.lettuce.core.api.StatefulRedisConnection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.time.Duration;
import java.util.List;

public class LettuceRedisClient {
    private static final Logger logger = LoggerFactory.getLogger(LettuceRedisClient.class);

    public static void main(String[] args) {
        RedisClient client = buildClient();

        StatefulRedisConnection<String, String> connection = client.connect(new RedisURI("localhost", 6379, Duration.ofMillis(10)));
//        logger.info("before");
        List<KeyValue<String, String>> list = connection.sync().mget("foo", "bar");
//        logger.info("after");
        for (KeyValue<String, String> stringStringKeyValue : list) {
            logger.info("! {} : {}", stringStringKeyValue.getKey(), stringStringKeyValue.getValueOrElse("NULL"));
        }
    }

    public static RedisClient buildClient() {
        RedisClient redisClient = RedisClient.create();
        redisClient.setDefaultTimeout(Duration.ofMillis(100));
        redisClient.setOptions(ClientOptions.builder().socketOptions(SocketOptions.builder().connectTimeout(Duration.ofMillis(10)).tcpNoDelay(true).build()).build());
        return redisClient;
    }

    public static final RedisURI redisUri = new RedisURI("localhost", 6379, Duration.ofMillis(100));
}
