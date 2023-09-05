package helpers;

import com.github.javafaker.Faker;

public class DataGenerator {

    public static String getRandomEmail(){
        Faker faker = new Faker();
        return faker.name().firstName().toLowerCase()+faker.random().nextInt(0,100)+"@test.com";
    }

    public static String getRandomUsername(){
        return new Faker().name().username();
    }
}
