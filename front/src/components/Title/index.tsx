import React from "react";
import "./Title.css";

type TitleTypes = {
  label: string;
  style?: React.CSSProperties;
};

const Title = ({ label, style, ...rest }: TitleTypes) => {

  return (
    <h1 style={style}>{label}</h1>
  );
};

export default Title;
