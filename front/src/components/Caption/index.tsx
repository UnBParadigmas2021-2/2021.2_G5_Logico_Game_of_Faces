import React from "react";
import "./Caption.css";

type CaptionTypes = {
  label?: string;
  style?: React.CSSProperties;
};

const Caption = ({ label, style }: CaptionTypes) => {

  return (
    <caption style={style}>{label}</caption>
  );
};

export default Caption;
