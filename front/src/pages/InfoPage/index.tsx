import React from "react";
import { Button, Title, Caption } from "../../components";
import { Styles } from "../../utils/Styles";

const IMAGE_BACKGROUND = "background.webp";
const { innerHeight, innerWidth } = window;

type InfoPageTypes = {
  title?: string;
  caption?: string;
  onClick?: () => void;
  buttonLabel?: string;
};

const InfoPage = ({ title, caption, onClick, buttonLabel }: InfoPageTypes) => {
  const renderText = () => {
    if (title) return <Title label={title} style={styles.titlePosition} />;
    return <Caption label={caption} style={styles.captionPosition} />;
  };

  return (
    <React.Fragment>
      <div style={styles.mainBox}>
        {renderText()}
        <Button
          label={buttonLabel}
          onClick={onClick}
          size="large"
          style={styles.buttonPosition}
        />
      </div>
      <img
        src={process.env.PUBLIC_URL + IMAGE_BACKGROUND}
        alt=""
        width="100%"
        height={innerHeight}
      />
    </React.Fragment>
  );
};

const styles: Styles = {
  mainBox: {
    position: "absolute",
    top: innerHeight * 0.05,
    right: innerWidth * 0.05,
    width: "50%",
    display: "flex",
    flexDirection: "column",
    height: innerHeight * 0.45,
    justifyContent: "space-between",
  },
  buttonPosition: {
    alignSelf: "center",
    marginTop: 30,
  },
  titlePosition: {
    textAlign: "center",
  },
  captionPosition: {
    textAlign: "center",
    marginTop: 30,
  },
};

export default InfoPage;
