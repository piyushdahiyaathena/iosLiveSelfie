/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import React from 'react';
import {
  SafeAreaView,
  Text,
  NativeModules
} from 'react-native';

const {Connect} = NativeModules;

function App(): JSX.Element {
  
  Connect.goToNative();
  
  return (
    <SafeAreaView>
      <Text>sdbchjsbdlhjd</Text>
    </SafeAreaView>
  );
}

export default App;
