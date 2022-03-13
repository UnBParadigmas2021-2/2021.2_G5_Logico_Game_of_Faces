import { Button, Caption, Frame, Title } from "../../components";
import { Styles } from "../../utils/Styles";


const {innerHeight} =  window;

const PhotoPage = () => {
  return (
    <div style={styles.stackDiv}>
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
      <div style={styles.stackDivAbsolute}>
        <Caption label="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor" />
        <div style={styles.buttonsBox}>
          <Button label="Sim" onClick={() => {}} style={styles.buttonMargin} />
          <Button label="Nao" onClick={() => {}} />
        </div>
      </div>
    </div>
  );
};

const styles: Styles = {
  stackDiv: {
    display: "flex",
    flexDirection: "column",
    paddingTop: innerHeight*0.05
  },
  stackDivAbsolute: {
    display: "flex",
    flexDirection: "column",
    alignSelf: 'center',
    position: "absolute",
    bottom: innerHeight*0.1,
  },
  titleAligment: {
    textAlign: "center",
    lineHeight: 0,
  },
  buttonsBox: {
    display: "flex",
    flexDirection: "row",
    alignSelf: "center",
    marginTop: 50,
  },
  buttonMargin: {
    marginRight: 20,
  },
  frameMargin: {
    marginRight: 8,
    marginTop: 8,
  },
  frameBox: {
    display: "flex",
    flexWrap: "wrap",
    padding: 20,
    alignSelf: "center",
    justifyContent: "space-evenly",
  },
};

export default PhotoPage;
