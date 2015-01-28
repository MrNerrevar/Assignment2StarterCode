import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.UnsupportedAudioFileException;
import javax.sound.sampled.Clip;
import javax.sound.sampled.LineUnavailableException;
import java.io.IOException;

AudioInputStream[] inputStream = new AudioInputStream[12];
Clip[] clips = new Clip[2];
String audio[];

void setupAudio()
{
  audio = new String[] {"shoot", "explode"};
  for(int i = 1; i <= 2; i++)
  {
    try
    {
      inputStream[i-1] = AudioSystem.getAudioInputStream(new File(dataPath(audio[i-1] + ".wav")));
      clips[i-1] = AudioSystem.getClip();
      clips[i-1].open(inputStream[i-1]);
    }
    catch(UnsupportedAudioFileException ex)
    {
      ex.printStackTrace(); 
    }
    catch(LineUnavailableException ex)
    {
      ex.printStackTrace();
    }
    catch(IOException ex)
    {
       ex.printStackTrace(); 
    }
  } 
}
