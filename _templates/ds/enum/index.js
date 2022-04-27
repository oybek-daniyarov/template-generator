const { readdirSync } = require("fs");

const componentPath = "./src";

const getDirectories = (source) =>
  readdirSync(source, { withFileTypes: true })
    .filter((dirent) => dirent.isDirectory())
    .map((dirent) => dirent.name);



let options = {
  directory: "",
  component: "",
  name: "",
  enums: [],
};

module.exports = {
  prompt: ({ prompter, inquirer, args }) => {


    return prompter
      .prompt(
        {
          type: "select",
          choices: ["atom", "mol", "org"],
          name: "directory",
          message: `What's atomic directory?`,
        }
      )
      .then(({ directory, name }) => {
        //options.directory = directory;
        return prompter
          .prompt([

            {
              type: "select",
              choices: getDirectories(`${componentPath}/${directory}`),
              name: "component",
              message: `Where do you want to add enum`,
            },
            {
              type: "input",
              name: "name",
              message: "Enter enum name",
              validate(value) {
                const pass = value.match(/^[A-Za-z]+$/);
                if (pass) {
                  return true;
                }
                return "Please enter valid enum name or press ctrl+c to cancel";
              },
            },
            {
              type: "input",
              name: "enums",
              message: `Enter enums by comma seperated string, ex: primary,secondary`,
              validate(value) {
                const pass = value.match(/^[A-Za-z,\-_]+$/);
                if (pass) {
                  return true;
                }
                return "Please enter valid enum name or press ctrl+c to cancel";
              },
            },
          ])
          .then((answers) => {
            return {...answers,directory: directory}
            //options = { ...options, ...answers };
            //return ask()
          });
      });
  },
};
