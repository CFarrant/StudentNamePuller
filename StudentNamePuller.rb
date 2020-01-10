require "tk"

class GUI
  @loaded_list = ""

  def initialize
    @NamePuller = NamePuller.new
    @NamePuller.init
    @x = 0
    @image_y = 0
    root = TkRoot.new do
      title "Student Name Puller"
      background "firebrick"
      minsize(395, 365)
      maxsize(395, 365)
    end

    @left_frame = TkFrame.new(root) do
      background "firebrick"
      padx 25
      pady 25
      grid('column': 0, 'row': 1)
    end

    @right_frame = TkFrame.new(root) do
      background "firebrick"
      padx 25
      pady 25
      grid('column': 1, 'row': 1)
    end

    load = proc {
      @listbox.clear
      @NamePuller.load(@combobox.current)
      @loaded_list = @NamePuller.class_list
      @NamePuller.class_list.each_with_index do |student, i|
        @listbox.insert i, "#{student[0]}, #{student[1]}"
      end
      p "[DEBUG]: Loaded Class List #{@loaded_list}..."
    }

    save = proc {
      @NamePuller.save
      p "[DEBUG]: Saved Class List #{@loaded_list}..."
    }

    create = proc {
      @filename = 0
      @prompt = TkToplevel.new(root) {
        title "Create New Class List"
        background "firebrick"
        minsize(395, 365)
        maxsize(395, 365)
      }

      @output_label = TkLabel.new(@prompt) {
        text "Message Output:"
        pack('side': "top")
      }

      @output = TkEntry.new(@prompt) {
        font TkFont.new("times 10 bold")
        pack('side': "top")
        pack('fill': "x")
      }
      @output.value = "Please enter Name for the New Class List..."

      submit_prompt = proc {
        @filename = @input.value
        @NamePuller.add_class_list(@filename)
        p "[DEBUG]: Created Class List #{@filename}.txt..."

        @prompt.destroy
      }

      @submit_button = TkButton.new(@prompt) {
        text "Submit"
        command submit_prompt
        pady 10
        pack('side': "bottom")
      }

      @input = TkEntry.new(@prompt) {
        font TkFont.new("times 10 bold")
        pack('side': "bottom")
        pack('fill': "x")
      }

      @intput_label = TkLabel.new(@prompt) {
        text "User Input (Filename without Extension):"
        pack('side': "bottom")
      }
    }

    delete = proc {
      @filename = 0
      @prompt = TkToplevel.new(root) {
        title "Delete Old Class List"
        background "firebrick"
        minsize(395, 365)
        maxsize(395, 365)
      }

      @output_label = TkLabel.new(@prompt) {
        text "Message Output:"
        pack('side': "top")
      }

      @output = TkEntry.new(@prompt) {
        font TkFont.new("times 10 bold")
        pack('side': "top")
        pack('fill': "x")
      }
      @output.value = "Please enter Name of the Class List to Delete..."

      submit_prompt = proc {
        @filename = @input.value
        @NamePuller.remove_class_list(@filename)
        p "[DEBUG]: Deleted Class List #{@filename}.txt..."

        @prompt.destroy
      }

      @submit_button = TkButton.new(@prompt) {
        text "Submit"
        command submit_prompt
        pady 10
        pack('side': "bottom")
      }

      @input = TkEntry.new(@prompt) {
        font TkFont.new("times 10 bold")
        pack('side': "bottom")
        pack('fill': "x")
      }

      @intput_label = TkLabel.new(@prompt) {
        text "User Input (Filename without Extension):"
        pack('side': "bottom")
      }
    }

    add = proc {
      @lname = 0
      @fname = 0
      @prompt = TkToplevel.new(root) {
        title "Add Student to Class List"
        background "firebrick"
        minsize(395, 365)
        maxsize(395, 365)
      }

      @output_label = TkLabel.new(@prompt) {
        text "Message Output:"
        pack('side': "top")
      }

      @output = TkEntry.new(@prompt) {
        font TkFont.new("times 10 bold")
        pack('side': "top")
        pack('fill': "x")
      }
      @output.value = "Please Enter the Students First and Last Name(s)..."

      submit_prompt = proc {
        @fname = @input_first.value
        @lname = @input_last.value
        @NamePuller.add_student(@fname, @lname)
        p "[DEBUG]: Added Student [#{@lname}, #{@fname}] to Class List"

        @prompt.destroy
      }

      @submit_button = TkButton.new(@prompt) {
        text "Submit"
        command submit_prompt
        pady 10
        pack('side': "bottom")
      }

      @input_last = TkEntry.new(@prompt) {
        font TkFont.new("times 10 bold")
        pack('side': "bottom")
        pack('fill': "x")
      }

      @intput_label_last = TkLabel.new(@prompt) {
        text "User Input (Last Name):"
        pack('side': "bottom")
      }

      @input_first = TkEntry.new(@prompt) {
        font TkFont.new("times 10 bold")
        pack('side': "bottom")
        pack('fill': "x")
      }

      @intput_label_first = TkLabel.new(@prompt) {
        text "User Input (First Name):"
        pack('side': "bottom")
      }
    }

    remove = proc {
      @lname = 0
      @fname = 0
      @prompt = TkToplevel.new(root) {
        title "Remove Student from Class List"
        background "firebrick"
        minsize(395, 365)
        maxsize(395, 365)
      }

      @output_label = TkLabel.new(@prompt) {
        text "Message Output:"
        pack('side': "top")
      }

      @output = TkEntry.new(@prompt) {
        font TkFont.new("times 10 bold")
        pack('side': "top")
        pack('fill': "x")
      }
      @output.value = "Please Enter the Students First and Last Name(s)..."

      submit_prompt = proc {
        @fname = @input_first.value
        @lname = @input_last.value
        @NamePuller.remove_student(@fname, @lname)
        p "[DEBUG]: Removed Student [#{@lname}, #{@fname}] from Class List"

        @prompt.destroy
      }

      @submit_button = TkButton.new(@prompt) {
        text "Submit"
        command submit_prompt
        pady 10
        pack('side': "bottom")
      }

      @input_last = TkEntry.new(@prompt) {
        font TkFont.new("times 10 bold")
        pack('side': "bottom")
        pack('fill': "x")
      }

      @intput_label_last = TkLabel.new(@prompt) {
        text "User Input (Last Name):"
        pack('side': "bottom")
      }

      @input_first = TkEntry.new(@prompt) {
        font TkFont.new("times 10 bold")
        pack('side': "bottom")
        pack('fill': "x")
      }

      @intput_label_first = TkLabel.new(@prompt) {
        text "User Input (First Name):"
        pack('side': "bottom")
      }
    }

    random = proc {
      @listbox.selection_clear(0, @loaded_list.size)
      @index = rand(0..(@loaded_list.size - 1))
      @listbox.selection_set(@index, @index)
      p "[DEBUG]: Selected a Random Student from the Class List"
    }

    @load_button = TkButton.new(@left_frame) {
      text "Load Current Class List"
      command load
      pady 10
      pack('fill': "x")
    }

    @save_button = TkButton.new(@left_frame) {
      text "Save Current Class List"
      command save
      pady 10
      pack('fill': "x")
    }

    @new_button = TkButton.new(@left_frame) {
      text "Create New Class List"
      command create
      pady 10
      pack('fill': "x")
    }

    @del_button = TkButton.new(@left_frame) {
      text "Delete Old Class List"
      command delete
      pady 10
      pack('fill': "x")
    }

    @combo_label = TkLabel.new(@left_frame) {
      text "Select a List to Load:"
      pack('side': "top")
    }

    @combobox = Tk::Tile::Combobox.new(@left_frame) {
      pack('side': "bottom")
      state "readonly"
    }
    @combobox.values = @NamePuller.loaded_class_lists

    @add_student_button = TkButton.new(@right_frame) {
      text "Add Student to List"
      command add
      pady 10
      pack('fill': "x")
    }

    @remove_student_button = TkButton.new(@right_frame) {
      text "Remove Student from List"
      command remove
      pady 10
      pack('fill': "x")
    }

    @pick_student = TkButton.new(@right_frame) {
      text "Randomly Select a Student"
      command random
      pady 10
      pack('fill': "x")
    }

    @list_label = TkLabel.new(@right_frame) {
      text "List of Students in Class List: "
      pack('side': "top")
    }

    @listbox = TkListbox.new(@right_frame) {
      pack('side': "top")
      selectmode "one"
    }
  end

  def self.update
    @combobox.values.clear
    @combobox.values = @NamePuller.loaded_class_lists
    @listbox.clear
    @NamePuller.load(@combobox.current)
    @loaded_list = @NamePuller.class_list
    @NamePuller.class_list.each_with_index do |student, i|
      @listbox.insert i, "#{student[0]}, #{student[1]}"
    end
  end
end

class NamePuller
  attr_accessor :loaded_class_lists
  attr_accessor :class_list
  @loaded_class_lists = []
  @class_list = []
  @filename = ""
  @input = ""
  @output = ""

  def poll_lists
    if File.exist?("./#{@foldername}") == false
      system "mkdir", "Lists"
    end
    if File.exist?("./Lists") == true
      @loaded_class_lists = Dir.entries("./#{@foldername}")
      @loaded_class_lists.delete(".")
      @loaded_class_lists.delete("..")
    end
  end

  def init
    @foldername = "Lists"
    @class_list = []
    if File.exist?("./#{@foldername}") == false
      system "mkdir", @foldername
      File.open("./README.txt", "w") do |file|
        file.puts "[README]"
        file.puts
        file.puts "You can manually create class lists using this format:"
        file.puts "{Last Name}, {First Name}"
        file.puts "Check the Example List (ALSO IN THIS FOLDER)"
        file.puts
        file.puts "Each on their on line of course, "
        file.puts "because this application will scan for each file on boot."
        file.puts
        file.puts "This is to make it easier to select the file you want via the GUI"
        file.close
      end
      File.open("./Lists/EXAMPLE.txt", "w") do |file|
        file.puts "Doe, Jane"
        file.puts "Smith, Alen"
        file.puts "Barker, Bob"
        file.puts "White, Betty"
        file.puts "Doe, John"
        file.puts "Smith, Alex"
        file.puts "Shean, Charlie"
        file.puts "Cyrus, Miley"
        file.close
      end
    end
    poll_lists
  end

  def selectfile(index)
    @filename = @loaded_class_lists[index]
  end

  def load(index)
    selectfile(index)
    @class_list = []
    File.open("./#{@foldername}/#{@filename}", "r") do |file|
      file.each_line do |line|
        newline = line.chomp
        splitname = newline.split(", ")
        @class_list.push splitname
      end
      file.close
    end
  end

  def save
    File.open("./#{@foldername}/#{@filename}", "w") do |file|
      @class_list.each do |student|
        file.puts "#{student.at(0)}, #{student.at(1)}"
      end
      file.close
    end
  end

  def add_class_list(listname)
    if File.exist?("../#{@foldername}/#{listname}.txt") == false
      File.open("./#{@foldername}/#{listname}.txt", "w") do |file|
        file.close
      end
    end
    poll_lists
  end

  def remove_class_list(listname)
    if File.exist?("./#{@foldername}/#{listname}.txt") == true
      File.delete("./#{@foldername}/#{listname}.txt")
    end
    poll_lists
  end

  def add_student(fname, lname)
    @class_list.push ["#{lname}", "#{fname}"]
  end

  def remove_student(fname, lname)
    count = 0
    deleted = 0
    tempstudent = ["#{lname}", "#{fname}"]
    @class_list.each do |student|
      if (student == tempstudent)
        @class_list.delete(student)
      end
    end
  end
end

p "[DEBUG]: Initalizing Program..."
GUI.new
p "[DEBUG]: Loading GUI..."
Tk.mainloop
