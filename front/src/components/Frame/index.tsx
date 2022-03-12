import React from "react";
import "./Frame.css";

type FrameTypes = {
  image: string;
  eliminated?: boolean;
  style?: React.CSSProperties;
};

const Frame = ({ image, eliminated = false, style }: FrameTypes) => {
  return (
    <div className="frame" style={style}>
      <div style={{ opacity: eliminated ? 0.5 : 0 }} />
      <img alt="" src={image} />
    </div>
  );
};

export default Frame;
