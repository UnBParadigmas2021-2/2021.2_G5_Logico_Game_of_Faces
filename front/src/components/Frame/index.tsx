import React from "react";
import "./Frame.css";

type FrameTypes = {
  image: string;
  eliminated?: boolean;
  style?: React.CSSProperties;
  size?: 'small' | 'large'
};

const Frame = ({ image, eliminated = false, size = 'small', style }: FrameTypes) => {
  const classNameFrame = size === 'large' ? 'largeFrame' : 'smallFrame'
  return (
    <div className="frame" style={style}>
      <div style={{ opacity: eliminated ? 0.5 : 0 }} className={classNameFrame}/>
      <img alt="" src={image} className={classNameFrame}/>
    </div>
  );
};

export default Frame;
