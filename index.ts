/*
Integer expression evaluator for SIMP
*/
type Types = "Operator" | "Num" | "Expression";
type Operator = { type: "Operator"; val: "+" | "-" | "*" | "/" };
type Num = { type: "Num"; val: number };
type Packed = [Expression, Operator, Expression];
type Expression = Num | { type: "Expression"; val: Packed };
type ResultStack = (Expression | Operator)[];
type CodeStack = (Expression | Operator)[];

/**
 * {n . c, r} -> {c, n . r}
 */
function t1(codeStack: CodeStack, resultStack: ResultStack) {
  resultStack.push(codeStack.pop() as Num);
}

/**
 * {E <packed>. c, r} -> {E1 E2 op . c, r}
 */
function t2(codeStack: CodeStack) {
  const e = codeStack.pop() as Expression;
  const [e1, op, e2] = e.val as Packed;
  codeStack.push(op);
  codeStack.push(e2);
  codeStack.push(e1);
}

/**
 * {op . c, n2 . n1 . r} -> {c, n . r} if n1 op n2 = n
 */
function t3(codeStack: CodeStack, resultStack: ResultStack) {
  const { val: n2 } = resultStack.pop() as Num;
  const { val: n1 } = resultStack.pop() as Num;
  const { val: op } = codeStack.pop() as Operator;
  const res: Num = { type: "Num", val: 0 };
  if (op == "*") {
    res.val = n1 * n2;
  } else if (op == "+") {
    res.val = n1 + n2;
  } else if (op == "-") {
    res.val = n1 - n2;
  } else if (op == "/") {
    res.val = n1 / n2;
  }
  resultStack.push(res);
}

const tests: { [key: string]: Expression } = {
  1: { type: "Num", val: 2 },
  2: {
    type: "Expression",
    val: [
      { type: "Num", val: 9 },
      { type: "Operator", val: "-" },
      { type: "Num", val: 4 },
    ],
  }, //5
  4: {
    type: "Expression",
    val: [
      {
        type: "Expression",
        val: [
          { type: "Num", val: 4 },
          { type: "Operator", val: "/" },
          { type: "Num", val: 2 },
        ],
      },
      { type: "Operator", val: "*" },
      {
        type: "Expression",
        val: [
          { type: "Num", val: 5 },
          { type: "Operator", val: "+" },
          { type: "Num", val: 2 },
        ],
      },
    ],
  }, // 14
};

function runProgram(e: Expression): ResultStack {
  const res: ResultStack = [];
  const code: CodeStack = [e];
  while (code.length != 0) {
    if (code[code.length - 1].type == "Num") {
      t1(code, res);
    } else if (code[code.length - 1].type == "Expression") {
      t2(code);
    } else if (code[code.length - 1].type == "Operator") {
      t3(code, res);
    }
  }
  return res;
}

Object.entries(tests).map(([testNumber, test]) => {
  console.log({ testNumber });
  console.log({ res: runProgram(test) });
});
