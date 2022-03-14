import React from "react";
import "./Button.css";

type ButtonTypes = {
  label?: string;
  onClick?: () => void;
  size?: "small" | "large";
  style?: Omit<React.CSSProperties, "paddingRight" | "paddingLeft">;
};

const Button = ({ label, onClick, size = "small", style }: ButtonTypes) => {
  const padding = size === "small" ? 75 : 120;

  return (
    <button
      onClick={onClick}
      style={{ paddingRight: padding, paddingLeft: padding, ...style }}
    >
      {label}
    </button>
  );
};

export default Button;
