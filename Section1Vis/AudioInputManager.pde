import processing.sound.*;

PApplet pThis = this;

public class AudioInputManager {
  AudioIn mic;
  Amplitude amp;
  FFT fft;
  int bands = 16;
  float[] spectrum = new float[bands];
  
  
  public AudioInputManager() {
    mic = new AudioIn(pThis, 0);
    amp = new Amplitude(pThis);
    fft = new FFT(pThis, bands);
    mic.start();
    amp.input(mic);
    fft.input(mic);
  }

  void showAmplitude(){
    println(amp.analyze() * 10);
  }
  
  void updatePitch(){
    fft.analyze(spectrum);
    
    for (int i = 0; i < spectrum.length; i++) {
      spectrum[i] *= 1000;
    }
  }
  
  //private int calculateBackgroundFrequency(){
  // int totalFrequency = 0;
  // for (int i = 0; i < bands; i++){
  //   totalFrequency += spectrum[i];
  // }
  // return totalFrequency / bands;
  //}
  
  void showPitch(){
    //println(fft.analyze(spectrum));
    println(pitch());
  }
  
  float pitch(){
    updatePitch();
    float totalFrequency = 0;
    for (int i = 0; i < bands; i++){
      totalFrequency += spectrum[i];
    }
    return (totalFrequency / bands) * 1000 - 2;
    
  }
  
  public float[] getSpectrum() {
    return spectrum;
  }
  
  
  //public int getAmplitude(){
    
  //}
  
  //mic.getLevel() returns the amplitude of the sound
}
