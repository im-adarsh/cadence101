package cadence

import "go.uber.org/cadence"

func getNameActivity() (string, error) {

	return "Cadence", nil
}

func sayHello (name string) (string, error) {
	return "Hello " + name + "!", nil
}

func DemoWorkFlow(ctx cadence.Context) error  {

	ao := cadence{

	}

	ctx = cadence.WithActivityOptions(ctx, ao)

	var name string

}
