import { Button, Caption, Frame, Title } from "../../components";
import { Styles } from '../../utils/Styles';

const PhotoPage = () => {
  return (
    <div style={styles.mainDiv}>
      <Title label="Game of Faces" style={styles.titleAligment} />
      <div style={styles.frameBox}>
        {[1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0].map(
          () => (
            <Frame
              image={process.env.PUBLIC_URL + "mocked_image.png"}
              style={styles.frameMargin}
            />
          )
        )}
      </div>
      <Caption label="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor" />
      <div style={styles.buttonsBox}>
        <Button label="Sim" onClick={() => {}} style={styles.buttonMargin} />
        <Button label="Nao" onClick={() => {}} />
      </div>
    </div>
  );
};


const styles: Styles = {
  mainDiv: {
    display: "flex",
    flexDirection: "column",
  },
  titleAligment: {
    textAlign: "center",
    lineHeight: 0,
  },
  buttonsBox: {
    display: "flex",
    flexDirection: "row",
    alignSelf: "center",
    marginTop: 20,
  },
  buttonMargin: {
    marginRight: 20,
  },
  frameMargin: {
    marginRight: 8,
    marginTop: 8,
  },
  frameBox: {
    flexWrap: "wrap",
    marginRight: 16,
    marginLeft: 16,
  },
};

export default PhotoPage;
