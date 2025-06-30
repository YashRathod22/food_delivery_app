import { View, Image, Animated } from 'react-native';
import React from 'react';
import { useStyles } from 'react-native-unistyles';
import { loginStyles } from '@unistyles/authStyles';
import CustomText from '@components/global/CustomText';

const LoginScreen = () => {
  const { styles } = useStyles(loginStyles);
  return (
    <View style={styles.container}>
      <Image
        source={require('@assets/images/login.png')}
        style={styles.cover}
      />
      <Animated.ScrollView
        bounces={false}
        keyboardShouldPersistTaps="handled"
        keyboardDismissMode="on-drag"
        contentContainerStyle={styles.bottomContainer}
      >
        <CustomText variant="h2" fontFamily="Okra-Bold" style={styles.title}>
          India's #1 Food Delivery & Dining App
        </CustomText>
      </Animated.ScrollView>
    </View>
  );
};

export default LoginScreen;
