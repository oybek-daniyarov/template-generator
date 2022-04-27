
const propQuestions = [
  {
    type: "input",
    name: "propName",
    message: "Enter property name",
    validate(value) {
      const pass = value.match(/([a-zA-Z]*:(string|number|boolean|object))/g);
      if (pass) {
        return true;
      }

      return "Please enter valid name or press ctrl+c to cancel";
    },
  },
  {
    type: "confirm",
    name: "enterMore",
    message: "Enter more?",
    default: false,
  },
];

const props = []
let options = {};
module.exports = {
  prompt: ({ prompter, args, h  }) => {

    const askMore = () => {
      return prompter.prompt(propQuestions).then(({ propName, enterMore }) => {
        let enumValue = propName.split(':');
        let demoValue = `"${enumValue[0]}"`;

        if(enumValue[1] === "number"){
          demoValue = 1;
        }
        if(enumValue[1] === "boolean"){
          demoValue = "true";
        }
        if(enumValue[1] === "object"){
          demoValue = "{}";
        }

        //let enumClassName = h.changeCase.pascal(`${options.directory}-${options.name}-${enumValue[0]}-enum`)
        props.push({
          name: enumValue[0],
          type: enumValue[1],
          defaultValue: demoValue,
          /*enumClassName: enumValue[1] === "enum" ? `${enumClassName}` : "",
          enumFileName: enumValue[1] === "enum" ? `${h.changeCase.param(enumValue[0])}.enum` : "",*/
        });
        if (enterMore) {
          return askMore();
        } else {
          return {...options,props:props};
        }
      });
    };

    return prompter.prompt([
      {
        type: "select",
        choices: ["atom", "mol", "org"],
        name: "directory",
        message: `What's atomic directory?`,
      },
      {
        type: "input",
        name: "name",
        message: `What's component name?`,
        validate(value) {
          const pass = value.match(/^[A-Za-z]+$/);
          if (pass) {
            return true;
          }

          return "Please enter valid name or press ctrl+c to cancel";
        },
      },
      {
        type: 'confirm',
        name: 'createProps',
        message: 'do you want to add props as well?',
        default: false,
      }
    ]).then((answers) => {
      options = { ...options, ...answers };

      if(answers.createProps){
        return askMore()
      }
      return  options;
    });
  },
};
